using App.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.DAO
{
    public class TableDAO
    {
        private static TableDAO instance;

        public static TableDAO Instance {
            get
            {
                if (instance == null) instance = new TableDAO(); return TableDAO.instance;
            }
            private set { TableDAO.instance = value; }  }

        public static int TableWidth = 90;
        public static int TableHeight = 90;
    

        private TableDAO() { }

        public void SwitchTable(int id1, int id2)
        {
            DataProvider.Instance.ExecuteQuery("USP_SwitchTabel @idTable1 , @idTabel2", new object[] { id1, id2 });
        }

        public List<Table> LoadTableList()
        {
            List<Table> tableList = new List<Table>();

            DataTable data = DataProvider.Instance.ExecuteQuery("USP_GetTableList");

            foreach (DataRow item in data.Rows)
            {
                Table table = new Table(item);
                tableList.Add(table);
            }
            return tableList;
           
        }
        public List<Table> GetListTable()
        {
            List<Table> tableList = new List<Table>();

            string query = "SELECT * FROM TableFood";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow row in data.Rows)
            {
                Table table = new Table(row);
                tableList.Add(table);
            }

            return tableList;
        }
        public bool InsertTable(string name, string status)
        {
            string query = "INSERT INTO TableFood (name, status) VALUES (@name, @status)";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { "@name", name, "@status", status });

            return result > 0;
        }
        public bool DeleteTable(int id)
        {
            string query = "DELETE FROM TableFood WHERE id = @id";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { id });

            return result > 0; // Trả về true nếu xóa thành công, ngược lại là false.
        }
     





    }
}

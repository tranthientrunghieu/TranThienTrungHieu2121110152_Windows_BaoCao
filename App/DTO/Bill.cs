using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.DTO
{
     public class Bill
    {

        public Bill(int id, DateTime? dateCheckin, DateTime? dateCheckOut, int status, int discount = 0)
        {
            this.ID = id;
            this.DateCheckIn = dateCheckin;
            this.DateCheckOut = dateCheckOut;
            this.Status = status;
            this.Discount = discount;
        }
        public Bill(DataRow row)
        {
            this.ID = (int)row["ID"];
            this.DateCheckIn = (DateTime?)row["dateCheckin"];
            var dateCheckOutTemp = row["dateCheckOut"];
            if (dateCheckOutTemp.ToString() != "")

            this.DateCheckOut = (DateTime?)dateCheckOutTemp;
            this.Status = (int)row["status"];

            if (row["discount"].ToString() != "")
                this.Discount = (int)row["discount"];

        }

        private int discount;

        public int Discount
        {
            get { return discount; }
            set { discount = value; }
        }


        private int status;
        public int Status
        {
            get { return status; }
            set { status = value; }

        }
        private DateTime? DateCheckOut;

        private DateTime? dateCheckIn;
        private DateTime? DateCheckIn
        {
            get { return dateCheckIn;  }
            set { dateCheckIn = value; }
        }

        private int iD;

        public int ID { 
            get { return iD; } 
            set { iD = value; }
        }    


    }
}

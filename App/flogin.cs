using App.DAO;
using App.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace App
{
    public partial class flogin : Form
    {
        public flogin()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txbUserName_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbPassWord_TextChanged(object sender, EventArgs e)
        {

        }

        private void flogin_Load(object sender, EventArgs e)
        {

        }



        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string passWord = txbPassWord.Text;
            if (Login(userName, passWord))
            {
                Account loginAccount = AccountDAO.Instance.GetAccountByUserName(userName);
                fTableManager f = new fTableManager(loginAccount);
             
                this.Hide();
                f.ShowDialog();  // bạn xử lý phần này rồi xử lý phần dưới
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên tài khỏan hoặc mật khẩu");
            }
          
        }

        bool Login(string userName, string passWord)
        {

            return AccountDAO.Instance.Login(userName, passWord);
               
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit(); // bạn có thật sự muốn thoát hay ko
        }

        private void flogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có thật sự muốn thoát chương trình?", "thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {

                e.Cancel = true;  // phủ định nếu mà nhân nút oke cho thoát
            }
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
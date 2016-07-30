﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;  
namespace SDPFinal
{
    public partial class Loan : System.Web.UI.Page
    {
        string fnam = "89877";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                fnam = Session["Value"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("LogIn.aspx");
            }
            if (fnam == "89877")
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                nam_label.Text = fnam;
                TextBox3.Text = fnam;

            }
        }

        [WebMethod]
        public static string insertdata(string head, string typ, string dat, string amnt, string dcc, string rmk, string ck, string str)
        {
            //string ab = nam + "  " + typ;
            string verifier;
            string refu="0";
            string due = "0";
            verifier = "";
            int tik;
            if (ck == "1")
            {
                tik = 1;
                verifier = str;
            }
            else tik = 0;
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("INSERT INTO Loan (Borrower_Name,Date,Loan_Amount,Refund_Amount,Due_Amount,Borrower_Type,Doc_Code,Remarks,Inserted_By,Verified,Verified_By) VALUES('" + head + "','" + dat + "','" + amnt + "','" + refu + "','" + due + "','" + typ + "','" + dcc + "','" + rmk + "','" + str + "','" + tik + "','" + verifier + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string b = "OK";
            return b;
        }

        protected void Revenues_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Revenues.aspx");
        }

        protected void Loan_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Loan.aspx");
        }

        protected void Loan_refund_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("LoanRefund.aspx");
        }

        protected void Expenses_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Expenses.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void userlist_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("UserList.aspx");
        }
    }
}
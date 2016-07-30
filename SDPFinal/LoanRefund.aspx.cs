using System;
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
    public partial class LoanRefund : System.Web.UI.Page
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
        public static string insertdata(int lid, string dat, string amnt, string dcc, string rmk, string ck, string str)
        {
            string nam="";
            int checker = 2,was_ref=0,was_loan=0;
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Select * from Loan where [Loan ID]='" + lid + "'", con);
            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                nam = reader["Borrower_Name"].ToString();
                was_ref = int.Parse(reader["Refund_Amount"].ToString());
                was_loan = int.Parse(reader["Loan_Amount"].ToString());
                checker = 3;
            }
            if(checker==2)
            {
                string b = "notok";
                return b;
            }
            else
            {
                string verifier;
                
                verifier = "";
                int tik;
                if (ck == "1")
                {
                    tik = 1;
                    verifier = str;
                }
                else tik = 0;
                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con2 = new SqlConnection(cs2);
                SqlCommand cmd2 = new SqlCommand("INSERT INTO LoanRefund (Loan_ID,Borrower_Name,Date,Amount,Doc_Code,Remarks,Inserted_By,Verified,Verified_By) VALUES('" + lid + "','" + nam + "','" + dat + "','" + amnt + "','" + dcc + "','" + rmk + "','" + str + "','" + tik + "','" + verifier + "')", con2);
                con2.Open();
                cmd2.ExecuteNonQuery();
                con2.Close();

                int new_amnt = was_ref + int.Parse(amnt);
                int new_due = was_loan - new_amnt;
                
                string cs3 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con3 = new SqlConnection(cs3);
                SqlCommand cmd3 = new SqlCommand("UPDATE Loan SET Refund_Amount = '" + new_amnt + "',Due_Amount = '" + new_due +  "' Where [Loan ID] = '" + lid + "'", con3);
                con3.Open();
                cmd3.ExecuteNonQuery();
                con3.Close();

                string b = "OK";
                return b;
            }
            
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
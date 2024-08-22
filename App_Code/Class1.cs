using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
	public Class1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    SqlConnection con = new SqlConnection();

    SqlCommand cmd = new SqlCommand();

    SqlDataAdapter adpt = new SqlDataAdapter();

    public DataSet GetDS(string qry)
    {
        DataSet ds = new DataSet();

        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = "SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;";
            con.Open();
        }

        cmd.Connection = con;
        cmd.CommandText = qry;

        adpt.SelectCommand = cmd;
        adpt.Fill(ds);

        return ds;
    }


    public DataTable GetDT(string qry)
    {
        DataTable ds = new DataTable();

        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = "SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;";
            con.Open();
        }

        cmd.Connection = con;
        cmd.CommandText = qry;

        adpt.SelectCommand = cmd;
        adpt.Fill(ds);

        return ds;
    }


    public void ExeQry(string qry)
    {

        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = "SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;";
            con.Open();
        }

        cmd.Connection = con;
        cmd.CommandText = qry;
        cmd.ExecuteNonQuery();

    }

    public String getScalar(string qry)
    {
        String v;

        if (con.State == ConnectionState.Closed)
        {
            con.ConnectionString = "SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;";

            con.Open();
        }
        cmd.Connection = con;

        cmd.CommandText = qry;

        v = cmd.ExecuteScalar().ToString();

        return v;
    }




}

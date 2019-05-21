using System;
using System.Data.SqlClient;

namespace TestConnection
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                using (var connection = new SqlConnection(args[0]))
                {
                    connection.Open();

                    Console.WriteLine("Connection succeeded");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadLine();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechnicalTest.Procedure
{
    public class Shared
    {
        public static void Update(string agreementNumber, string bpkbNo, string branchID, DateTime? bpkbDate, string fakturNo, DateTime? fakturDate,
            string locationID, string policeNo, DateTime? bpkbDateIN, string LastUpdateBy, DateTime? LastUpdateOn, ref int status, ref string statusMessage)
        {
            using (var db = new TechnicalTesEntities())
            {
                using (var transact = db.Database.BeginTransaction())
                {
                    try
                    {
                        var number = db.tr_bpkb.Where(p => p.agreement_number == agreementNumber).FirstOrDefault();
                        if (number == null)
                        {
                            throw new Exception("Data tidak ditemukan");
                        }
                       
                        number.bpkb_no = bpkbNo;
                        number.branch_id = branchID;
                        number.bpkb_date = bpkbDate;
                        number.faktur_no = fakturNo;
                        number.faktur_date = fakturDate;
                        number.location_id = locationID;
                        number.police_no = policeNo;
                        number.bpkb_date_in = bpkbDateIN;
                        number.last_update_by = LastUpdateBy;
                        number.last_update_on = LastUpdateOn;
                      
                       
                        db.SaveChanges();

                        transact.Commit();

                        status = 1;
                        statusMessage = "Berhasil diperbarui";
                    }
                    catch (Exception ex)
                    {
                        transact.Rollback();
                        status = 2;
                        statusMessage = ex.Message;
                    }
                }
            }
        }
      
        public static void Save(string agreementNumber, string bpkbNo, string branchID, DateTime? bpkbDate, string fakturNo, DateTime? fakturDate,
            string locationID, string policeNo, DateTime? bpkbDateIN, string createdBy, DateTime? createdON, ref int status, ref string statusMessage) 
        {
            using (var db = new TechnicalTesEntities())
            {
                using (var transact = db.Database.BeginTransaction())
                {
                    try
                    {
                        var number = db.tr_bpkb.Where(p => p.agreement_number == agreementNumber).FirstOrDefault();
                        if (number != null)
                        {
                            throw new Exception("Data sudah ada dalam database");
                        }
                        var newNumber = new tr_bpkb()
                        {
                            agreement_number = agreementNumber,
                            bpkb_no = bpkbNo,
                            branch_id = branchID,
                            bpkb_date = bpkbDate,
                            faktur_no = fakturNo,
                            faktur_date = fakturDate,
                            location_id = locationID,
                            police_no = policeNo,
                            bpkb_date_in = bpkbDateIN,
                            created_by = createdBy,
                            created_on = createdON
                        };
                        db.tr_bpkb.Add(newNumber);
                        db.SaveChanges();

                        transact.Commit();

                        status = 1;
                        statusMessage = "Berhasil dibuat";
                    }
                    catch (Exception ex)
                    {
                        transact.Rollback();
                        status = 2;
                        statusMessage = ex.Message;
                    }
                }
            }
        }

        public static GetUser_Result GetUser(string username)
        {
            using (var db = new TechnicalTesEntities())
            {
                return db.ms_user
                        .Where(p => p.user_name == username)
                        .Select(p => new GetUser_Result()
                        {
                            Username = p.user_name,                         
                            Password = p.password
                          
                        })
                        .FirstOrDefault();
            }
        }

        public class GetUser_Result
        {
            public string Username { get; set; }          
            public string Password { get; set; }
          
        }

       
    }
}
 
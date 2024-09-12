using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace TechnicalTest.Models
{
    public class SaveModel
    {
        public List<ms_storage_location> ListLocation { get; set; }
       
         [Required(ErrorMessage = "Wajib diisi")]
        public string AgreementNumber { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public string BpkbNo { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public string BranchID { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public DateTime? BpkbDate { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public string FakturNo { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public DateTime? FakturDate { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public string LocationID { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public string PoliceNo { get; set; }
         [Required(ErrorMessage = "Wajib diisi")]
        public DateTime? BpkbDateIN { get; set; }
         public int? isUpdate { get; set; }
       
        public string CreatedBy { get; set; }
        public DateTime? CreatedON { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime? LastUpdatedON { get; set; }       
    }
}
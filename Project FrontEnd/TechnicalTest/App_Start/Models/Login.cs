using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace TechnicalTest.Models
{
    public class Login
    {
        [Required(ErrorMessage = "Username tidak boleh kosong")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password tidak boleh kosong")]
        public string Password { get; set; }
    }
}
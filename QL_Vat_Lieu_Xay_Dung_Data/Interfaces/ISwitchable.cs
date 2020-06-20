using System;
using System.Collections.Generic;
using System.Text;
using QL_Vat_Lieu_Xay_Dung_Data.Enums;

namespace QL_Vat_Lieu_Xay_Dung_Data.Interfaces
{
    public interface ISwitchable
    {
        public Status Status { get; set; }
    }
}

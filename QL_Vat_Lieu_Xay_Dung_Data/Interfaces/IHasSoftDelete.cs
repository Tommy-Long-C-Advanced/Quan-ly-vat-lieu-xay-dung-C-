using System;
using System.Collections.Generic;
using System.Text;

namespace QL_Vat_Lieu_Xay_Dung_Data.Interfaces
{
    public interface IHasSoftDelete
    {
        public bool IsDeleted { get; set; }
    }
}

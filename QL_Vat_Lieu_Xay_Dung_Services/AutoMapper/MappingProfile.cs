using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using QL_Vat_Lieu_Xay_Dung_Data.Entities;
using QL_Vat_Lieu_Xay_Dung_Services.ViewModels.Product;

namespace QL_Vat_Lieu_Xay_Dung_Services.AutoMapper
{
    public class MappingProfile: Profile
    {
        public MappingProfile()
        {
            CreateMap<ProductCategory, ProductCategoryViewModel>();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using QL_Vat_Lieu_Xay_Dung_Data.Entities;
using QL_Vat_Lieu_Xay_Dung_Data.Enums;
using QL_Vat_Lieu_Xay_Dung_Data.IRepositories;
using QL_Vat_Lieu_Xay_Dung_Infrastructure.Interfaces;
using QL_Vat_Lieu_Xay_Dung_Services.Interfaces;
using QL_Vat_Lieu_Xay_Dung_Services.ViewModels.Product;

namespace QL_Vat_Lieu_Xay_Dung_Services.Implementation
{
    public class ProductCategoryService : IProductCategoryService
    {
        private readonly IMapper _mapper;
        private readonly IProductCategoryRepository _productCategoryRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ProductCategoryService(IProductCategoryRepository productCategoryRepository,IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _productCategoryRepository = productCategoryRepository;

        }
        public ProductCategoryViewModel Add(ProductCategoryViewModel productCategoryVm)
        {
            var productCategory = _mapper.Map<ProductCategoryViewModel, ProductCategory>(productCategoryVm);
            _productCategoryRepository.Add(productCategory);
            return productCategoryVm;

        }

        public void Update(ProductCategoryViewModel productCategoryVm)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            _productCategoryRepository.Remove(id);
        }

        public List<ProductCategoryViewModel> GetAll()
        {
            return _productCategoryRepository.FindAll().OrderBy(x => x.ParentId).ProjectTo<ProductCategoryViewModel>(_mapper.ConfigurationProvider)
                .ToList();
        }

        public List<ProductCategoryViewModel> GetAll(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
            {
                return _productCategoryRepository
                    .FindAll(x => x.Name.Contains(keyword)).OrderBy(x => x.ParentId)
                    .ProjectTo<ProductCategoryViewModel>(_mapper.ConfigurationProvider).ToList();

            }
            else
                return _productCategoryRepository.FindAll().OrderBy(x => x.ParentId)
                    .ProjectTo<ProductCategoryViewModel>(_mapper.ConfigurationProvider).ToList();
        }

        public List<ProductCategoryViewModel> GetAllByParentId(int parentId)
        {
            return _productCategoryRepository.FindAll(x => x.Status == Status.Active && x.ParentId == parentId)
                .ProjectTo<ProductCategoryViewModel>(_mapper.ConfigurationProvider).ToList();
        }

        public ProductCategoryViewModel GetById(int id)
        {
            return _mapper.Map<ProductCategory, ProductCategoryViewModel>(_productCategoryRepository.FindById(id));
        }

        public void UpdateParentId(int sourceId, int targetId, Dictionary<int, int> items)
        {
            throw new NotImplementedException();
        }

        public void ReOrder(int sourceId, int targetId)
        {
            throw new NotImplementedException();
        }

        public List<ProductCategoryViewModel> GetHomeCategories(int top)
        {
            return _productCategoryRepository.FindAll(x => x.HomeFlag, c => c.Products).OrderBy(x => x.HomeOrder)
                .Take(top).ProjectTo<ProductCategoryViewModel>(_mapper.ConfigurationProvider).ToList();

        }

        public void Save()
        {
            _unitOfWork.Commit();
        }
    }
}

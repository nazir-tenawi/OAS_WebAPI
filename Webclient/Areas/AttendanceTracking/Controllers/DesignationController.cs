﻿using System;
using System.Linq;
using System.Web.Mvc;
using Ems.AttendanceTracking.Models;
using Ems.AttendanceTracking.Services;
using Webclient.Controllers;
using Webclient.Filters;
using Webclient.Helpers;
using Webclient.Models;


namespace Webclient.Areas.AttendanceTracking.Controllers
{
    [SessionHelper]
    public class DesignationController : BaseController
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return PartialView();
        }

        [HttpGet]
        public JsonResult GetAll(GridSettings grid)
        {

            var query = new DesignationBusiness().GetAll(_userInfo.CompanyId??0).AsQueryable();
            var listOfFilteredData = FilterHelper.JQGridFilter(query, grid).AsQueryable();
            var listOfPagedData = FilterHelper.JQGridPageData(listOfFilteredData, grid);
            var count = listOfFilteredData.Count();
            var result = new
            {
                total = (int)Math.Ceiling((double)count / grid.PageSize),
                page = grid.PageIndex,
                records = count,
                rows = listOfPagedData
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Save(DesignationModel model)
        {
            model.CompanyId = _userInfo.CompanyId;

            return Json(new DesignationBusiness().Save(model));
        }
        [HttpGet]
        public JsonResult Get(int id)
        {
            return Json(new DesignationBusiness().GetAll(_userInfo.CompanyId??0).FirstOrDefault(x => x.Id == id), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Delete(int id)
        {
            var response = new DesignationBusiness().Delete(id);
            return Json(response, JsonRequestBehavior.AllowGet);
        }

    }
}

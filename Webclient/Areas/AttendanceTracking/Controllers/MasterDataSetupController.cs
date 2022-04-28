using Oas.BusinessTracker.Common;
using Microsoft.Reporting.WebForms;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Oas.AttendanceTracking.Models;
using Oas.AttendanceTracking.Services;
using Webclient.Controllers;
using Webclient.Filters;
using Webclient.Helpers;
using Webclient.Models;

namespace Webclient.Areas.AttendanceTracking.Controllers
{
    [SessionHelper]
    public class MasterDataSetupController : BaseReportController
    {
        private readonly SetupInputHelpBusiness _setupBusiness;
        private readonly EmployeeBusiness _employeeBusiness;
        public MasterDataSetupController()
        {
            _setupBusiness = new SetupInputHelpBusiness();
            _employeeBusiness = new EmployeeBusiness(_userInfo.Id);
        }
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

            var query = _setupBusiness.GetAll().AsQueryable();
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

        [HttpGet]
        public JsonResult GetAllInputHelpType()
        {
            var textValueInputHelpList = Enum.GetValues(typeof(InputHelpType)).Cast<InputHelpType>().Select(v => new NameValueModel
            {
                Name = EnumUtility.GetDescriptionFromEnumValue((InputHelpType)v),
                Value = (int)v,

            }).ToList().OrderBy(c => c.Name);
            return Json(textValueInputHelpList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveInputHelp(SetupInputHelpModel model)
        {
            return Json(_setupBusiness.Save(model));
        }
        [HttpGet]
        public JsonResult GetInputHelp(int id)
        {
            return Json(_setupBusiness.GetAll().FirstOrDefault(x=>x.Id==id), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult DeleteInputHelp(int id)
        {
            var response = _setupBusiness.DeleteInputHelp(id);
            return Json(response, JsonRequestBehavior.AllowGet);
        }

    }
}

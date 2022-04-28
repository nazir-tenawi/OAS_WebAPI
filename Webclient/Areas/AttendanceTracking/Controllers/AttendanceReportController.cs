using Oas.BusinessTracker.Common;
using Oas.BusinessTracker.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
    public class AttendanceReportController : BaseReportController
    {
        private readonly AttendanceReportBusiness _attendanceReportBusiness;
        public AttendanceReportController()
        {
            _attendanceReportBusiness = new AttendanceReportBusiness();
        }
        #region VeiwPage
        public ActionResult MonthlyAttendanceReports()
        {
            return PartialView();
        }
        public ActionResult MonthlyAttendanceReportDetails()
        {
            return PartialView();
        }
        public ActionResult AllUserAttendanceReports()
        {
            return PartialView();
        }
        #endregion
        [HttpGet]
        public JsonResult GetInitMonthYear()
        {
            var monthList = Enum.GetValues(typeof(MonthList)).Cast<MonthList>().Select(v => new NameIdPairModel
            {
                Id = (int)v,
                Name = EnumUtility.GetDescriptionFromEnumValue(v)
            }).ToList();
            var yearList = new List<int>();
            for (int i = 2020; i <= DateTime.UtcNow.Year; i++)
            {
                yearList.Add(i);
            }
            return Json(new { monthList, yearList, selectedMonth = DateTime.Now.Month, selectedYear = DateTime.Now.Year }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetMonthlyAttendanceReports(int monthId, int yearId)
        {
            int? cId = _userInfo.CompanyId.HasValue && _userInfo.CompanyId.Value > 0 ? _userInfo.CompanyId.Value : (int?)null;
            var data = _attendanceReportBusiness.GetAttendanceReports(cId).Where(x=>x.AttendanceMonth==monthId && x.AttendanceYear==yearId).AsQueryable();
            
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetAllUserAttendanceReports(int monthId, int yearId)
        {
            int? cId = _userInfo.CompanyId.HasValue && _userInfo.CompanyId.Value > 0 ? _userInfo.CompanyId.Value : (int?)null;
            var data = _attendanceReportBusiness.GetAllUserReports(cId).Where(x => x.AttendanceMonth == monthId && x.AttendanceYear == yearId).AsQueryable();

            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetMonthlyUserReports(GridSettings grid,string employeeId,int monthId,int yearId)
        {
            var query = _attendanceReportBusiness.GetUserReports(employeeId).Where(x => x.AttendanceMonth == monthId && x.AttendanceYear == yearId).AsQueryable();
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
    }
}

using System.Collections.Generic;
using Oas.AttendanceTracking.Models;

namespace Oas.AttendanceTracking.Interfaces
{
    public interface IAttendanceReport
    {
        List<AttendanceReportModel> GetAttendanceReports(int? companyId);
        List<AttendanceReportModel> GetUserReports(string userId);
        List<AttendanceReportModel> GetAllUserReports(int? companyId);
    }
}

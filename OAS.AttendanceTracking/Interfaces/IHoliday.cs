using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Models;

namespace Oas.AttendanceTracking.Interfaces
{
    public interface IHoliday
    {
        ResponseModel Save(HolidayModel model);
        List<HolidayModel> GetAll(int? cId);
        HolidayModel GetById(int id);
        ResponseModel Delete(int id);
    }
}

using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Models;

namespace Oas.AttendanceTracking.Interfaces
{
    public interface IDepartment
    {
        ResponseModel Save(DepartmentModel model);
        List<DepartmentModel> GetAll();
        ResponseModel Delete(int id);
    }
}

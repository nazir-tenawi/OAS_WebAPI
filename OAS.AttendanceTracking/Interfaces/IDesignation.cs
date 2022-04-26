using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Models;

namespace Oas.AttendanceTracking.Interfaces
{
    public interface IDesignation
    {
        ResponseModel Save(DesignationModel model);
        List<DesignationModel> GetAll(int companyId);
        ResponseModel Delete(int id);
    }
}

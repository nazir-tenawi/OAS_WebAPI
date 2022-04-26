using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Models;

namespace Oas.AttendanceTracking.Interfaces
{
    public interface ILeavePolicy
    {
        ResponseModel Save(LeavePolicyModel model);
        List<LeavePolicyModel> GetAll();
        ResponseModel Delete(int id);
    }
}

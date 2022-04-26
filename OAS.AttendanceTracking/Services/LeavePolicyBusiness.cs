using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Interfaces;
using Oas.AttendanceTracking.Mappers;
using Oas.AttendanceTracking.Models;


namespace Oas.AttendanceTracking.Services
{
	public class LeavePolicyBusiness
	{
		private readonly ILeavePolicy _LeavePolicy;

		public LeavePolicyBusiness()
		{
			_LeavePolicy = AttendanceUnityMapper.GetInstance<ILeavePolicy>();
		}
		public ResponseModel Save(LeavePolicyModel model)
		{
			return _LeavePolicy.Save(model);
		}
		public IEnumerable<LeavePolicyModel> GetAll()
		{
			var list = _LeavePolicy.GetAll();
			return list;
		}

		public ResponseModel Delete(int id)
		{
			return _LeavePolicy.Delete(id);
		}
	}
}

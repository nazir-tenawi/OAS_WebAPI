using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Interfaces;
using Oas.AttendanceTracking.Mappers;
using Oas.AttendanceTracking.Models;


namespace Oas.AttendanceTracking.Services
{
	public class DepartmentBusiness
    {
		private readonly IDepartment _department;

		public DepartmentBusiness()
		{
			_department = AttendanceUnityMapper.GetInstance<IDepartment>();
		}
		public ResponseModel Save(DepartmentModel model)
		{
			return _department.Save(model);
		}
		public IEnumerable<DepartmentModel> GetAll()
		{
			var list = _department.GetAll();
			return list;
		}

		public ResponseModel Delete(int id)
		{
			return _department.Delete(id);
		}
	}
}

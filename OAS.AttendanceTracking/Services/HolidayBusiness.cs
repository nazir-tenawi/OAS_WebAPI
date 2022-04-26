using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Interfaces;
using Oas.AttendanceTracking.Mappers;
using Oas.AttendanceTracking.Models;


namespace Oas.AttendanceTracking.Services
{
	public class HolidayBusiness
	{
		private readonly IHoliday _holiday;

		public HolidayBusiness()
		{
			_holiday = AttendanceUnityMapper.GetInstance<IHoliday>();
		}
		public ResponseModel Save(HolidayModel model)
		{
			return _holiday.Save(model);
		}
		public IEnumerable<HolidayModel> GetAll(int? cId)
		{
			var list = _holiday.GetAll(cId);
			return list;
		}

		public HolidayModel GetById(int id)
		{
			return _holiday.GetById(id);
		}

		public ResponseModel Delete(int id)
		{
			return _holiday.Delete(id);
		}
	}
}

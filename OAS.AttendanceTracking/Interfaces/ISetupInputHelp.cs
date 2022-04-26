using Oas.BusinessTracker.Common.Models;
using System.Collections.Generic;
using Oas.AttendanceTracking.Models;
namespace Oas.AttendanceTracking.Interfaces
{
	public interface ISetupInputHelp
	{
		ResponseModel Save(SetupInputHelpModel model);
		List<SetupInputHelpModel> GetAll();
		ResponseModel DeleteInputHelp(int id);
		ResponseModel UpdateQrCode(EmployeeExportModel qrCodeModel);
	}
}

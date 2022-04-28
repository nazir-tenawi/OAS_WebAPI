using Oas.BusinessTracker.Common;
using System;
using System.ComponentModel;

namespace Oas.AttendanceTracking.Models
{
    public class AttendanceReportModel
    {
        public string UserId { get; set; }
        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
        public string DepartmentName { get; set; }
        public string DesignationName { get; set; }
        public decimal PresentDays { get; set; }
        public string PresentDaysString { get { if (PresentDays <= 0) return string.Empty; return PresentDays + " Days"; } }
        public decimal AbsentDays { get; set; }
        public string AbsentDaysString { get { if (AbsentDays <= 0) return string.Empty; return AbsentDays + " Days"; } }
        public decimal TotalDays { get { return PresentDays + AbsentDays; } }
        public string OfficeHours { get { return (TotalDays * 8) + " Hours"; } }
        public decimal CompletedHours
        {
            get
            {
                return decimal.Round(CompletedMinutes / 60, 2, MidpointRounding.AwayFromZero);
            }
        }
        public string CompletedHoursString { get { if (CompletedHours <= 0) return string.Empty; return CompletedHours + " Hours"; } }
        public decimal OverTime
        {
            get
            {
                //presentdays*8*60 = 8 hours daile
                return decimal.Round((CompletedMinutes - (PresentDays*8*60) )/ 60, 2, MidpointRounding.AwayFromZero);
            }
        }
        public string OverTimeString { get { if (OverTime <= 0) return string.Empty; return OverTime + " Hours"; } }
        public decimal CompletedMinutes { get; set; }
        public int? MissingOutTime { get; set; }
        public string MissingOutTimeString { get { if (MissingOutTime <= 0) return string.Empty; return MissingOutTime + " Days"; } }
        public DateTime? CheckInTime { get; set; }
        public DateTime? CheckOutTime { get; set; }
        public string LogInDate
        {
            get
            {
                return CheckInTime.HasValue ? CheckInTime.Value.ToZoneTime().ToString(Constants.DateFormat) : string.Empty;
            }
        }
        public string LogOutDate
        {
            get
            {
                return CheckOutTime.HasValue ? CheckOutTime.Value.ToZoneTime().ToString(Constants.DateFormat) : string.Empty;
            }
        }
        public string LogInTime
        {
            get
            {
                 return CheckInTime.HasValue ? CheckInTime.Value.ToZoneTime().ToString(Constants.TimeFormat) : string.Empty; 
            }
        }
        public string LogOutTime
        {
            get
            {
                return CheckOutTime.HasValue ? CheckOutTime.Value.ToZoneTime().ToString(Constants.TimeFormat) : string.Empty;
            }
        }
        public int AttendanceMonth { get; set; }
        public int AttendanceYear { get; set; }
        public string MonthName
        {
            get
            {
                if (AttendanceMonth == 0)
                    return string.Empty;
                return EnumUtility.GetDescriptionFromEnumValue((MonthList)AttendanceMonth);
            }
        }
        public string LogInLocation { get; set; }
        public string LogOutLocation { get; set; }

        public string DeviceName { get; set; }
        public string DeviceBrand { get; set; }
        public string DeviceModelName { get; set; }

    }
}

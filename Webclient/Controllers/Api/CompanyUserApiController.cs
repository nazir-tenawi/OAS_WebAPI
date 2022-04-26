using System.Web.Http;
using Oas.AttendanceTracking.Interfaces;
using Oas.AttendanceTracking.Mappers;

namespace Webclient.Controllers.Api
{
    public class CompanyUserApiController : BaseApiController
    {
        private readonly IUserCredential _userCredential;
        public CompanyUserApiController()
        {
            _userCredential = AttendanceUnityMapper.GetInstance<IUserCredential>();
        }

        [HttpGet]
        public IHttpActionResult GetUserList()
        {
            var result = _userCredential.GetAllUser();
            return Ok(result);
        }
    }
}

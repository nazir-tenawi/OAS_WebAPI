

(function () {
    var dashBoardFactory = function ($http) {

        var getAttendanceFeed = function () {
            return $http.get('/AttendanceTracking/Dashboard/GetAttendanceFeed',
                {})
                .then(function (response) {
                    return response;
                });
        };
       
        var getLeaveStatus = function () {
            return $http.get('/AttendanceTracking/Dashboard/GetLeaveStatus',
                {})
                .then(function (response) {
                    return response;
                });
        };
        return {
            GetAttendanceFeed: getAttendanceFeed,
            GetLeaveStatus: getLeaveStatus,
        };
    };

    medicareApp.factory('dashBoardFactory', dashBoardFactory);

})();

medicareApp.controller("attendanceDashboardController", ['$scope', '$uibModal', 'dashBoardFactory', function ($scope, $uibModal, dashBoardFactory) {


    $scope.TodayAttendance = {};
    $scope.GetTodayAttendanceFeed = function () {
        dashBoardFactory.GetAttendanceFeed().then(function (response) {
            $scope.TodayAttendance = response.data;
        });
    };



    $scope.closeModal = function () {
        $scope.modalInstance.close();
    };
}]);


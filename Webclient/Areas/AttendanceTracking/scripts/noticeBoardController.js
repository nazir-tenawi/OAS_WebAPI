

(function () {
    var noticeBoardFactory = function ($http) {

        var saveData = function (model) {
            return $http.post('/AttendanceTracking/NoticeBoard/Save',
                { model: model })
                .then(function (response) {
                    return response;
                });
        };

        var getData = function (id) {
            return $http.get('/AttendanceTracking/NoticeBoard/Get?id=' + id,
                {})
                .then(function (response) {
                    return response;
                });
        };

        var deleteData = function (id) {
            return $http.get('/AttendanceTracking/NoticeBoard/Delete?id=' + id,
                {})
                .then(function (response) {
                    return response;
                });
        };

        return {

            SaveData: saveData,
            GetData: getData,
            DeleteData: deleteData

        };
    };

    medicareApp.factory('noticeBoardFactory', noticeBoardFactory);

})();



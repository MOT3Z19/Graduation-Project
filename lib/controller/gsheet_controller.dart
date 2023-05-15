import 'package:gsheets/gsheets.dart';

class UserSheetApi {
  static const _credentials = r'''{
  {
  "type": "service_account",
  "project_id": "users-386813",
  "private_key_id": "525fb3d44cc8b78296f580b9fa49f2be27729e3e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDh48QWW/scK3Y3\n9C48WHYdb/luJPhl0Gb4VPOJtqIZXpmnHmxoTZFBGCEBvbzM+9P4zj1QTU4RfpYI\nmWnZ36/N7tNAx0W7GnUN50h72K6Syd8ZaxVS4UvXy3ZC18avGLiUGCG9xCMQydeF\n/zjlUUS6nd2SM8O7WCXQVtTa4StCEqNoYgmbcKyikkSsQ4wRKzfTaavCJ9sR6rD/\nB8Ay7wQ23ubhkZz5fpPeFEgC6mW3sPAUUhNxa9YXnB1mXZTFevGXKb7S3iz3+XcV\nVOgsaUdZJobKPIrNMelyItkd6jvWG2gJ8vTdrm4DCH44qx+7daOl077qog3QgDO3\ntzAjAGqTAgMBAAECggEAD+/sb/FpvEPlZtmPq4qdkW0gNDZf33sT0MCESuU7oZOW\n6VS7AaQ7Xn7ae/ohiHWEr+teexHBM3hyvcTpKXSKkvp0etUJupjexQOE4ywCARxE\nunvfeMX+07OosoWbyyhw2WNXJMGNAcxj1tyPbJUjxruIRvOSWIpFvLcWSc0U1Wfu\nTZ6R4XRZ/4wb5ZIWRfsb5jv521ix9fbmkB6LOjMTfgaqFsENeL9W3lczAwU3cCYE\n/h/8PxSuUQcJaLmVLi0HmKUMh76eOeM62xg31l1EEs3oF58OZIFB06XOaZiznyKr\nP+rApTdxd85DywB//fzwClkXXE/fwZV8XKVeZ0bPTQKBgQDxiLFMrFDfnjdlaT/F\nBriM1HdDxwJR2nxrMh5fxSxLARqYHGmov0g3wNWAA1W3AklDyjy0/5Jyl6L++WwV\nY2yI1lms2z7BM9nig4X5kSfn9LEEObkKHws3L+++hXKvMaz0HTEA+ncyKbp1A4zY\nr1Yhvj5DyUHYrCFdTDoEZIRs9QKBgQDvazVy3PhRmqW9BIIaI/DhPCHp7urQNFjh\ntUPE4Cpdr3zvePTSJIUErrRipjMFNLhJTCR2jXsBdszBnAzq+v3I1tlviXAC7B41\n3iAVOnr0vImAq9seFJsJkzEUaMXOL3ciElm+Ev26B/SnBVJgaiDHfgNvJi36bfJh\nQnNShPnEZwKBgGBWgUFvyaIn3TiZzlGr6Jhjdl6WVhqH5vBqwSq53nzcJ9tcGdiw\n0wFJ7N5udhXU15wuYiBff+4tBVpl6fJuAbBirsn/ePxezh1HEH0GpMAkHSbuTxv2\nXebZO+rmF2RBkBaePhmBzWE4u6JIlDkpVlWHKBapg5YEshogeVOfNCKxAoGAE4mI\nHwtxKBealsYbZ86vBXJGwjRA7SSYbDLCiPpR+rsrUs9oCw333N300mgFmdMnhrOz\n9gitlP0A0HvPgg1hUFZYAAYTIenqvTKXI6RWDEqmXd2oT9gWnr1oL+Ys3hp5ekpN\nEHm0Qs4LZOXGRx/h9OWPmi5faiQ2t0EY8A7x4tkCgYBLyn28+nR4xXRPCNt1EKDC\nekIuqBnpj5dfSdjBxoz0B+h4VC9Ss4tF/zAVRSb89D8uI1x5Cpxqk6wP5HhU4aGm\nBes21BLUlouq3TR2Nm51g+rtjyrL/QkDcoBO+3I520FeVtZKR3KOFtr4X4pv79Ko\nNm34DORWN8I/8Hfe/+QxPg==\n-----END PRIVATE KEY-----\n",
  "client_email": "usersheet@users-386813.iam.gserviceaccount.com",
  "client_id": "114750265923095893204",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/usersheet%40users-386813.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  }
  ''';

  static final _spreadsheetId = '1TLjIK5nAHwJCRFvv5r4qcgvXsVVwEC6_cBxNlxamDHg';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'User');
    final firstRow = await _userSheet?.values.row(1);
    print(firstRow);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}

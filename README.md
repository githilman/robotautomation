# Robot Framework Automation

Setup Robot Framework

Requirement
- Python
- Pip 

Install with python pip

    python3 -m pip install robotframework

Required Library for this test cases:

   ```
   python3 -m pip install robotframework-requests
   python3 -m pip install robotframework-jsonlibrary
   ```


Example test case:
- Authentication test to generate token with basic authentication **/test/authlogin.robot**
- Another Grant token test **/test/e2e.robot**
- Get method using Bearer Token **/test/getwtoken.robot**
- Get method test and validate it's value **/test/test.robot**

To run one of this test:
```
robot /test/testfile.robot
```

@echo off
setlocal enabledelayedexpansion

::-------------------------------------------------------------------
:: EcoTrack Cloud Run Deploy Script (Windows Command Prompt)
::-------------------------------------------------------------------

:: Path to service account key (adjust if moved)
set "GOOGLE_APPLICATION_CREDENTIALS=C:\New folder\key.json"

:: --------------------------------------------------------------
:: 1. Authenticate with the service account
:: --------------------------------------------------------------
echo [1/4] Authenticating with service account...
cmd /c gcloud auth activate-service-account --key-file="%GOOGLE_APPLICATION_CREDENTIALS%"
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Authentication failed. Please ensure gcloud SDK is installed and the key file exists.
    goto :error
)

:: --------------------------------------------------------------
:: 2. Set project and region (modify if needed)
:: --------------------------------------------------------------
set "PROJECT_ID=gifted-dreamer-494311-f6"
set "REGION=europe-west1"

gcloud config set project %PROJECT_ID%
if %ERRORLEVEL% neq 0 goto :error

gcloud config set run/region %REGION%
if %ERRORLEVEL% neq 0 goto :error

:: --------------------------------------------------------------
:: 3. Build Docker image locally
:: --------------------------------------------------------------
echo [2/4] Building Docker image...
docker build -t ecotrack-app .
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Docker build failed. Ensure Docker Desktop is running.
    goto :error
)

:: --------------------------------------------------------------
:: 4. Push image to Google Container Registry
:: --------------------------------------------------------------
docker tag ecotrack-app gcr.io/%PROJECT_ID%/ecotrack-app:latest
if %ERRORLEVEL% neq 0 goto :error

docker push gcr.io/%PROJECT_ID%/ecotrack-app:latest
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Docker push failed. Verify IAM permissions for the service account.
    goto :error
)

:: --------------------------------------------------------------
:: 5. Deploy to Cloud Run
:: --------------------------------------------------------------
echo [3/4] Deploying to Cloud Run...
gcloud run deploy ecotrack-service ^
    --image gcr.io/%PROJECT_ID%/ecotrack-app:latest ^
    --platform managed ^
    --region %REGION% ^
    --allow-unauthenticated
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Cloud Run deployment failed.
    goto :error
)

:: --------------------------------------------------------------
:: 6. Success
:: --------------------------------------------------------------
echo.
echo ====================================================
echo [4/4] EcoTrack successfully deployed to Cloud Run!
echo ====================================================gcloud run services describe ecotrack-service --region %REGION% --format="value(status.url)"goto :end

:error
echo.
echo Deployment terminated with errors. Review the messages above.
pause
exit /b 1

:end
echo.
echo Press any key to close this window.
pause

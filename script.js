const appVersion = "BUILD_VERSION_PLACEHOLDER";

document.getElementById('app-data').innerHTML = `
    <div class="info-row"><span class="label">Adres IP:</span> ${window.location.hostname}</div>
    <div class="info-row"><span class="label">Wersja:</span> ${appVersion}</div>
    <div class="info-row"><span class="label">Status:</span> <span style="color: #28a745;">Healthy</span></div>
`;

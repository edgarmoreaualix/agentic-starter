const API_PATH = "/backend/apps/orch-04-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-04-webapp/specialist.txt";

const titleEl = document.getElementById("project-title");
const chipsEl = document.getElementById("color-chips");
const statusEl = document.getElementById("status");
const featuresEl = document.getElementById("features");
const specialistEl = document.getElementById("specialist");

function renderApi(api) {
  titleEl.textContent = api.project_id;
  statusEl.textContent = `Status: ${api.status}`;

  const chips = [
    `color: ${api.color}`,
    `accent: ${api.accent}`,
    `background: ${api.background}`
  ];

  chipsEl.innerHTML = chips
    .map((chip, index) => {
      const className = index === 1 ? "chip accent" : "chip";
      return `<span class="${className}">${chip}</span>`;
    })
    .join("");

  featuresEl.innerHTML = (api.features || [])
    .map((feature) => `<li>${feature}</li>`)
    .join("");
}

async function load() {
  try {
    const [apiResp, specialistResp] = await Promise.all([
      fetch(API_PATH),
      fetch(SPECIALIST_PATH)
    ]);

    if (!apiResp.ok) throw new Error(`API request failed: ${apiResp.status}`);
    if (!specialistResp.ok) {
      throw new Error(`Specialist request failed: ${specialistResp.status}`);
    }

    const api = await apiResp.json();
    const specialist = await specialistResp.text();

    renderApi(api);
    specialistEl.textContent = specialist;
  } catch (error) {
    titleEl.textContent = "orch-04-webapp";
    statusEl.textContent = "Status: unavailable";
    specialistEl.textContent = `Load error: ${error.message}`;
  }
}

load();

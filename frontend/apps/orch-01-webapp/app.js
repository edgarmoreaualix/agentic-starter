const API_PATH = "/backend/apps/orch-01-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-01-webapp/specialist.txt";

const titleEl = document.getElementById("project-title");
const chipsEl = document.getElementById("color-chips");
const statusEl = document.getElementById("status-text");
const featureListEl = document.getElementById("feature-list");
const specialistEl = document.getElementById("specialist-message");
const errorEl = document.getElementById("error");

function renderChips(payload) {
  const chipData = [
    `color: ${payload.color}`,
    `accent: ${payload.accent}`,
    `background: ${payload.background}`
  ];

  chipsEl.innerHTML = chipData
    .map((text) => `<span class="chip">${text}</span>`)
    .join("");
}

function renderFeatures(features) {
  featureListEl.innerHTML = features.map((feature) => `<li>${feature}</li>`).join("");
}

async function loadApp() {
  try {
    const [apiRes, specialistRes] = await Promise.all([
      fetch(API_PATH),
      fetch(SPECIALIST_PATH)
    ]);

    if (!apiRes.ok || !specialistRes.ok) {
      throw new Error("Unable to load required app data.");
    }

    const apiPayload = await apiRes.json();
    const specialistText = await specialistRes.text();

    titleEl.textContent = apiPayload.project_id;
    statusEl.textContent = `Status: ${apiPayload.status}`;
    renderChips(apiPayload);
    renderFeatures(apiPayload.features || []);
    specialistEl.textContent = specialistText.trim();

    document.documentElement.style.setProperty("--accent", apiPayload.accent || "#ff4d4f");
    document.documentElement.style.setProperty("--background", apiPayload.background || "#fff1f0");
  } catch (error) {
    errorEl.hidden = false;
    errorEl.textContent = error.message;
    console.error(error);
  }
}

loadApp();

const API_PATH = "/backend/apps/orch-06-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-06-webapp/specialist.txt";

function setText(id, value) {
  const el = document.getElementById(id);
  if (el) el.textContent = value;
}

function renderChips(api) {
  const chips = document.getElementById("chips");
  if (!chips) return;

  const entries = [
    ["color", api.color],
    ["accent", api.accent],
    ["background", api.background]
  ];

  chips.innerHTML = entries
    .map(([k, v]) => `<span class="chip">${k}: ${v}</span>`)
    .join("");
}

function renderFeatures(features) {
  const list = document.getElementById("features");
  if (!list) return;

  list.innerHTML = (features || [])
    .map((feature) => `<li>${feature}</li>`)
    .join("");
}

async function loadApp() {
  try {
    const api = await fetch(API_PATH).then((r) => {
      if (!r.ok) throw new Error(`api load failed: ${r.status}`);
      return r.json();
    });

    setText("project-title", api.project_id || "orch-06-webapp");
    setText("status", api.status || "unknown");
    renderChips(api);
    renderFeatures(api.features);
  } catch (err) {
    setText("status", `Error: ${err.message}`);
  }

  try {
    const specialist = await fetch(SPECIALIST_PATH).then((r) => {
      if (!r.ok) throw new Error(`specialist load failed: ${r.status}`);
      return r.text();
    });
    setText("specialist", specialist.trim());
  } catch (err) {
    setText("specialist", `Error: ${err.message}`);
  }
}

loadApp();

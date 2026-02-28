const API_PATH = "/backend/apps/orch-03-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-03-webapp/specialist.txt";

async function fetchJson(path) {
  const response = await fetch(path);
  if (!response.ok) {
    throw new Error(`Failed to load ${path}: ${response.status}`);
  }
  return response.json();
}

async function fetchText(path) {
  const response = await fetch(path);
  if (!response.ok) {
    throw new Error(`Failed to load ${path}: ${response.status}`);
  }
  return response.text();
}

function renderChips(data) {
  const chips = document.getElementById("chips");
  const entries = [
    ["color", data.color],
    ["accent", data.accent],
    ["background", data.background]
  ];

  chips.innerHTML = entries
    .map(([key, value]) => {
      const style = key === "color" ? `background:${data.accent}` : `background:${value}`;
      return `<span class="chip"><span class="swatch" style="${style}"></span>${key}: ${value}</span>`;
    })
    .join("");
}

function renderData(data, specialistText) {
  document.getElementById("title").textContent = data.project_id;
  renderChips(data);

  document.getElementById("status").textContent = data.status;

  const features = document.getElementById("features");
  features.innerHTML = "";
  for (const feature of data.features ?? []) {
    const li = document.createElement("li");
    li.textContent = feature;
    features.appendChild(li);
  }

  document.getElementById("specialist").textContent = specialistText.trimEnd();
}

function renderError(message) {
  document.getElementById("title").textContent = "orch-03-webapp";
  document.getElementById("status").textContent = message;
  document.getElementById("specialist").textContent = "Unable to load specialist content.";
}

async function init() {
  try {
    const [apiData, specialistText] = await Promise.all([
      fetchJson(API_PATH),
      fetchText(SPECIALIST_PATH)
    ]);
    renderData(apiData, specialistText);
  } catch (error) {
    renderError(error.message);
  }
}

init();

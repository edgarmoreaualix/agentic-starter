const API_PATH = "/backend/apps/orch-05-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-05-webapp/specialist.txt";

const titleEl = document.getElementById("title");
const chipsEl = document.getElementById("chips");
const statusEl = document.getElementById("status");
const featuresEl = document.getElementById("features");
const specialistEl = document.getElementById("specialist");

function addChip(label, value) {
  const chip = document.createElement("span");
  chip.className = "chip";
  chip.textContent = `${label}: ${value}`;
  chipsEl.appendChild(chip);
}

async function loadBackend() {
  const response = await fetch(API_PATH);
  if (!response.ok) {
    throw new Error(`Backend request failed: ${response.status}`);
  }

  const data = await response.json();
  titleEl.textContent = data.project_id;
  statusEl.textContent = data.status;

  addChip("color", data.color);
  addChip("accent", data.accent);
  addChip("background", data.background);

  featuresEl.innerHTML = "";
  for (const feature of data.features || []) {
    const li = document.createElement("li");
    li.textContent = feature;
    featuresEl.appendChild(li);
  }
}

async function loadSpecialist() {
  const response = await fetch(SPECIALIST_PATH);
  if (!response.ok) {
    throw new Error(`Specialist request failed: ${response.status}`);
  }

  const text = await response.text();
  specialistEl.textContent = text.trim();
}

async function init() {
  try {
    await Promise.all([loadBackend(), loadSpecialist()]);
  } catch (error) {
    statusEl.textContent = "error";
    specialistEl.textContent = error.message;
  }
}

init();

const API_PATH = "/backend/apps/orch-02-webapp/api.json";
const SPECIALIST_PATH = "/frontend/apps/orch-02-webapp/specialist.txt";

const titleEl = document.querySelector("#title");
const statusEl = document.querySelector("#status");
const featuresEl = document.querySelector("#features");
const chipsEl = document.querySelector("#chips");
const specialistEl = document.querySelector("#specialist");

function addChip(label, value, swatch) {
  const chip = document.createElement("span");
  chip.className = "chip";
  chip.textContent = `${label}: ${value}`;
  if (swatch) {
    chip.style.background = swatch;
    chip.style.color = swatch.toLowerCase() === "blue" || swatch === "#1677ff" ? "#fff" : "#0f172a";
  }
  chipsEl.appendChild(chip);
}

async function loadBackend() {
  const response = await fetch(API_PATH);
  if (!response.ok) {
    throw new Error(`Failed to load ${API_PATH}`);
  }
  const data = await response.json();

  titleEl.textContent = data.project_id;
  statusEl.textContent = `Status: ${data.status}`;

  chipsEl.innerHTML = "";
  addChip("color", data.color, data.color);
  addChip("accent", data.accent, data.accent);
  addChip("background", data.background, data.background);

  featuresEl.innerHTML = "";
  (data.features || []).forEach((feature) => {
    const li = document.createElement("li");
    li.textContent = feature;
    featuresEl.appendChild(li);
  });
}

async function loadSpecialist() {
  const response = await fetch(SPECIALIST_PATH);
  if (!response.ok) {
    throw new Error(`Failed to load ${SPECIALIST_PATH}`);
  }
  specialistEl.textContent = await response.text();
}

Promise.all([loadBackend(), loadSpecialist()]).catch((error) => {
  statusEl.textContent = `Error: ${error.message}`;
  specialistEl.textContent = "Specialist content unavailable.";
});

export function initChartJsUsersLastMonth() {
  const chartEl = document.getElementById("usuariosChart");
  if (chartEl) {
    const labels = JSON.parse(chartEl.dataset.labels || "[]");
    const values = JSON.parse(chartEl.dataset.values || "[]");

    const ctx = chartEl.getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: "Usuarios registrados",
            data: values,
            backgroundColor: "rgba(54, 162, 235, 0.6)",
            borderColor: "rgba(54, 162, 235, 1)",
            barThickness: 5,
          },
        ],
      },
      options: {
        plugins: {
          legend: { display: false },
          tooltip: {
            enabled: false, // Desactiva el tooltip por defecto
            external: function (context) {
              // Crear el div si no existe
              let tooltipEl = document.getElementById("chartjs-tooltip");
              if (!tooltipEl) {
                tooltipEl = document.createElement("div");
                tooltipEl.id = "chartjs-tooltip";
                tooltipEl.style.position = "absolute";
                tooltipEl.style.background = "white";
                tooltipEl.style.borderRadius = "4px";
                tooltipEl.style.padding = "6px 8px";
                tooltipEl.style.fontSize = "0.875rem";
                tooltipEl.style.color = "#333";
                tooltipEl.style.whiteSpace = "nowrap";
                tooltipEl.style.pointerEvents = "none";
                tooltipEl.style.boxShadow = "0 1px 30px rgba(0, 0, 0, 0.1)";
                tooltipEl.style.zIndex = "9999";
                tooltipEl.style.transition = "opacity 0.2s ease";
                tooltipEl.style.opacity = "0";
                document.body.appendChild(tooltipEl);
              }

              const tooltipModel = context.tooltip;

              // Ocultar si no hay tooltip
              if (!tooltipModel || tooltipModel.opacity === 0) {
                tooltipEl.style.opacity = "0";
                return;
              }

              const label = tooltipModel.dataPoints?.[0]?.label || "";
              const value = tooltipModel.dataPoints?.[0]?.formattedValue || "";

              tooltipEl.innerHTML = `
                <div style="text-align: center;">
                  <div style="font-weight: bold;">${label}</div>
                  <br>
                  <div style="display: flex; align-items: center; justify-content: center; gap: 6px;">
                    <span style="
                      display: inline-block;
                      width: 8px;
                      height: 8px;
                      border-radius: 50%;
                      background-color: blue;">
                    </span>
                    <span class="fw-bold text-dark">${value}</span>
                  </div>
                </div>
                `;

              // Posicionar el tooltip encima del punto
              const canvasRect = context.chart.canvas.getBoundingClientRect();
              const tooltipWidth = tooltipEl.offsetWidth;

              tooltipEl.style.left = `${
                canvasRect.left +
                window.pageXOffset +
                tooltipModel.caretX -
                tooltipWidth / 2
              }px`;
              tooltipEl.style.top = `${
                canvasRect.top + window.pageYOffset + tooltipModel.caretY - 40
              }px`; // 40px arriba del punto
              tooltipEl.style.opacity = "1";
            },
          },
        },
        scales: {
          x: {
            display: false, // Oculta los nombres de los meses
          },
          y: {
            display: false, // Oculta el eje Y
          },
        },
      },
    });
  }
}

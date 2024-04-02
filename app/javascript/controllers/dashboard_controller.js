import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from 'chart.js';

Chart.register(...registerables)
export default class extends Controller {
 static values = { revenue: Array }
  initialize() {
    // this.element.textContent = "connected"
    const data = this.revenueValue.map((item) => item[1]/100.0)
    const labels = this.revenueValue.map((item) => item[0])
    const ctx = document.getElementById('revenueChart')

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Revenue $',
          data: data,
          borderWidth: 5,
          fill: true,
          borderColor: 'teal',
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        scales: {
          x: {
            grid: {
              display: true
            }
          },
          y: {
            border: {
              dash: [5, 5]
            },
            grid: {
              color: "#d4f3ef"
            },
            beginAtZero: true
          }
        }
      }
    })

  }
}

import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  static targets = ["calorieChart", "macroChart"]

  connect() {
    this.initializeCalorieChart()
    this.initializeMacroChart()
  }

  initializeCalorieChart() {
    const calorieCtx = this.calorieChartTarget.getContext('2d')
    const calorieGoal = this.data.get("calorieGoal")
    const caloriesConsumed = this.data.get("caloriesConsumed")
    const caloriesRemaining = calorieGoal - caloriesConsumed

    new Chart(calorieCtx, {
      type: 'doughnut',
      data: {
        labels: ['Consumed', 'Remaining'],
        datasets: [{
          data: [caloriesConsumed, caloriesRemaining],
          backgroundColor: ['rgba(54, 162, 235, 0.8)', 'rgba(200, 200, 200, 0.8)'],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          position: 'bottom',
        },
        title: {
          display: true,
          text: 'Calorie Consumption'
        }
      }
    })
  }

  initializeMacroChart() {
    const macroCtx = this.macroChartTarget.getContext('2d')
    new Chart(macroCtx, {
      type: 'bar',
      data: {
        labels: ['Protein', 'Fats', 'Carbohydrates'],
        datasets: [{
          label: 'Consumed',
          data: [35, 30, 30], // Replace with actual data
          backgroundColor: 'rgba(75, 192, 192, 0.8)',
          borderWidth: 1
        },
        {
          label: 'Target',
          data: [80, 30, 50], // Replace with actual target data
          backgroundColor: 'rgba(255, 99, 132, 0.8)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        },
        legend: {
          position: 'bottom'
        },
        title: {
          display: true,
          text: 'Macronutrient Breakdown (grams)'
        }
      }
    })
  }
}

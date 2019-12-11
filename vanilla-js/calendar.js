console.log('hello')
renderMonths = [0,1,2]
months = ['Jan','Feb','Mar', 'Apr','May','Jun','July','Aug','Sep','Oct','Nov','Dec']
dayArr = []
function renderCalendar(year, month){
    if(month > 11){
      return
    }

  let startOfMonth = new Date(year, month).getDay() || 7 - 1
  let numberOfDay = 32 - new Date(year, month, 32).getDate()

  let rendrMonth = document.getElementById('month')
  let rendrYear = document.getElementById('year')

  rendrMonth.textContent = months[month]
  rendrYear.textContent = year

  let renderNum = 1
  let tableBody = document.getElementById('table-body')
  dayArr.push({month:months[month], days:[] })
  for(let i = 0; i < 6; i++){
    let row = document.createElement('tr')

    for(let c = 0; c < 7; c++){
      if(i === 0 && c < startOfMonth){
        let td = document.createElement('td')
        td.classList.add('empty')
        dayArr[month].days.push({day:null })
        row.append(td)
      }else if(renderNum > numberOfDay){
        break
      }else{
        let td = document.createElement('td')
        td.textContent = renderNum
        dayArr[month].days.push({day:renderNum, })
        row.append(td)
        renderNum++
      }
    }
    tableBody.append(row)
  }

}

renderMonths.forEach((item, index) => renderCalendar(2019, item))

import { Exception } from "sass";

let me = document.getElementById('me');
let speech = document.getElementById('speechBubble');

const functionMap = {
  startSpeech: (variable) => startSpeech(variable),
  endSpeech: (variable) => endSpeech(variable)
};
  
function getRandomDelay(min, max) {
  const delay = Math.floor(Math.random() * (max - min + 1) + min);
  return Math.round(delay / 500) * 500; // Round delay to the nearest multiple of 0.5 seconds (500 milliseconds)
}

 
async function iterateObjectWithDelay(obj) {
  while (true) {
    const groupKeys = Object.keys(obj);
    const groupWeights = groupKeys.map(groupKey => ({ key: groupKey, weight: obj[groupKey].weight || 1 }));
    const selectedGroupKey = weightedRandomSelection(groupWeights).key;
    const selectedGroup = obj[selectedGroupKey];

    // Filter out the weight property from the object keys
    const objectKeys = Object.keys(selectedGroup).filter(key => key !== 'weight');


    for (const objectKey of objectKeys) {
      const entry = selectedGroup[objectKey];

      if (document.hidden) {
        await new Promise(resolve => {
          document.addEventListener('visibilitychange', function handler() {
            if (!document.hidden) {
              document.removeEventListener('visibilitychange', handler);
              resolve();
            }
          });
        });
      }

      me.setAttribute("src", entry.sprite);

      if (entry.startFunction) {
        let functionName = entry.startFunction
        if(entry.startVariable){
          functionMap[functionName](entry.startVariable); // Execute start function
        }else{
          functionMap[functionName]();
        }
      }

      const [minDelay, maxDelay] = entry.delayRange;
      const delay = getRandomDelay(minDelay, maxDelay);

      // Wait for the specified delay before proceeding to the next iteration
      await new Promise(resolve => setTimeout(resolve, delay));

      if (entry.endFunction) {
        if(entry.endVariable){
          functionMap[entry.endFunction](entry.endVariable); // Execute end function
        }else{
          functionMap[entry.endFunction]();
        }
      }
    }
  }
}

async function startSpeech(facts = []){
  let middle = document.getElementById('middle');
  speech.style.visibility = 'visible';
  middle.innerHTML = ""; 
  let fact = facts[Math.floor(Math.random() * facts.length)];    
  let factArray = fact.split("")
  for (const letter of factArray) {

    middle.innerHTML += letter;

    await new Promise(resolve => setTimeout(resolve, 40));
  }
}

function endSpeech(){
  speech.style.visibility = 'hidden';
}


function weightedRandomSelection(array) {
  // Calculate the total weight of all items in the array
  const totalWeight = array.reduce((acc, item) => acc + (item.weight || 1), 0);

  // Generate a random number between 0 and the total weight
  const randomValue = Math.random() * totalWeight;

  // Loop through the array to find the item whose weight matches the randomValue
  let cumulativeWeight = 0;
  for (const item of array) {
    cumulativeWeight += item.weight || 1;
    if (randomValue <= cumulativeWeight) {
      return item;
    }
  }
}

async function fetchSpriteData(){
  const response = await fetch(location.protocol + '//' + location.host+location.pathname + '/actions/_portfolio-core/sprites/get-data', {
    method: 'POST', headers: {
        'Accept': 'application/json', 'Content-Type': 'application/json'
    }, body: JSON.stringify({ 
        [window.Craft.csrfTokenName]: window.Craft.csrfTokenValue 
    })
  }).then(response => {
    if(response.ok){
      return response.json();
    }
    throw new Exception("something went wrong");
  }).then(success => {
    iterateObjectWithDelay(success);
  });

}

fetchSpriteData();


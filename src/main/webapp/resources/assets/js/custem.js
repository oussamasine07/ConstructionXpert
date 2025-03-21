const resourceSelect = document.getElementById("resource-select");
const resourceQty = document.getElementById("resourceQty");
const addResourceBtn = document.getElementById("addResourceBtn");
const resources = document.getElementById("resources");
const resourceItems = document.getElementById("resource-items");

let resourcesArr = resources.value != "" ? JSON.parse(resources.value) : [];
//let resourcesArr = [];

console.log(resourcesArr)

addResourceBtn.addEventListener("click", () => {

    // get the input fields values
    const resource = JSON.parse(resourceSelect.value);
    const resourceQtyVal = resourceQty.value;

    //create an object
    const resourceObj = {
        id: resourcesArr.length > 0 ? resourcesArr.length + 1 : 1,
        resourceId: parseInt(resource.resourceId),
        resourceName: resource.name,
        currentQuantity: parseInt(resource.quantity),
        quantity: parseInt(resourceQtyVal),
        unitPrice: parseFloat(resource.unitPrice)
    }

    resourcesArr.push(resourceObj);
    resources.setAttribute("value", JSON.stringify(resourcesArr))

    const div = createListItem(resourceObj)
    // add the element to dom
    resourceItems.appendChild(div)

    resourceQty.value = "";
});

// create a delete button
function createListItem ( resourceObj ) {
    const div = document.createElement("div");
    div.className = "text-white flex w-full items-center rounded-md p-2 pl-3 transition-all hover:bg-slate-800 focus:bg-slate-800 active:bg-slate-800 grid grid-cols-8 gap-3";
    div.id = `resource-item-${resourceObj.id}`;

    div.innerHTML = `
        <div class="col-span-4">${resourceObj.resourceName}</div>
        <div class="col-span-2">${resourceObj.quantity}</div>
        <div class="ml-auto col-span-2 grid place-items-center justify-self-end">
            <button data-parentElem="resource-item-${resourceObj.id}" onclick="removeItem(this)" class="rounded-md border border-transparent p-2.5 text-center text-sm transition-all text-slate-400 hover:bg-slate-700 focus:bg-slate-700 active:bg-slate-700 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" type="button">
                delete
            </button>
        </div>
    `

    return div;
}

if ( resourcesArr.length > 0 ) {
    resourcesArr.forEach(resource => {
        const div = createListItem(resource)
        resourceItems.appendChild(div)
    });
}

function removeItem ( e ) {
    const elemId = e.dataset.parentelem
    const resourceId = parseInt(elemId.split("-")[elemId.split("-").length - 1]);

    resourcesArr = resourcesArr.filter(rsc => rsc.id != resourceId  )

    resources.setAttribute("value", JSON.stringify(resourcesArr))

    resourceItems.removeChild(document.getElementById(elemId))


}


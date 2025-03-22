const resourceSelect = document.getElementById("resource-select");
const resourceQty = document.getElementById("resourceQty");
const addResourceBtn = document.getElementById("addResourceBtn");
const resources = document.getElementById("resources");
const qtyErrors = document.getElementById("qtyErrors").value != "" ? JSON.parse(document.getElementById("qtyErrors").value) : [];

const resourceItems = document.getElementById("resource-items");

let resourcesArr = resources.value != "" ? JSON.parse(resources.value) : [];

console.log(resourcesArr)

addResourceBtn.addEventListener("click", () => {

    // get the input fields values
    const resource = JSON.parse(resourceSelect.value);
    const resourceQtyVal = parseInt(resourceQty.value);

    if (resourceQtyVal > 0) {
        const resourceObj = {
            id: resourcesArr.length > 0 ? resourcesArr.length + 1 : 1,
            resourceId: parseInt(resource.resourceId),
            resourceName: resource.name,
            currentQuantity: parseInt(resource.quantity),
            quantity: resourceQtyVal,
            unitPrice: parseFloat(resource.unitPrice)
        }

        resourcesArr.push(resourceObj);
        resources.setAttribute("value", JSON.stringify(resourcesArr))

        const div = createListItem(resourceObj,0)
        resourceItems.appendChild(div)
        resourceQty.value = "";
    }
});

// create a delete button
function createListItem ( resourceObj, elemId ) {
    console.log(elemId);
    const div = document.createElement("div");
    div.className = "text-white flex w-full items-center rounded-md p-2 pl-3 transition-all hover:bg-slate-800 focus:bg-slate-800 active:bg-slate-800 grid grid-cols-8 gap-3";
    div.id = `resource-item-${resourceObj.id}`;

    div.innerHTML = `
        <div class="col-span-4">${resourceObj.resourceName}</div>
        <div class="col-span-2 flex justify-center items-center">
            <div class="mx-2">
                <input type="text" class="dark:bg-dark-900 h-11 w-1/2 rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 ${ resourceObj.id == elemId ? 'dark:border-error-700 text-error-800 dark:text-error-500' : 'dark:border-gray-700 text-gray-800 dark:text-white/90' } dark:bg-gray-900 dark:placeholder:text-white/30 dark:focus:border-brand-800" placeholder="Quantity" value="${resourceObj.quantity}" data-id="${resourceObj.id}" oninput="changeQty(this)">
            </div>
        </div>
        <div class="ml-auto col-span-2 grid place-items-center justify-self-end">
            <button class="inline-flex items-center gap-2 px-4 py-3 text-sm font-medium text-white transition rounded-lg bg-error-500 shadow-theme-xs hover:bg-error-600" type="button" data-parentElem="resource-item-${resourceObj.id}" onClick="removeItem(this)">
                <i class="fa-solid fa-trash"></i>
            </button>
        </div>
    `

    return div;
}

if (resourcesArr.length > 0) {
    resourcesArr.forEach((resource, idx) => {
        const elemId = qtyErrors[idx]
        const div = createListItem(resource, elemId)
        resourceItems.appendChild(div)
    });
}

function removeItem(e) {
    const elemId = e.dataset.parentelem
    const resourceId = parseInt(elemId.split("-")[elemId.split("-").length - 1]);
    resourcesArr = resourcesArr.filter(rsc => rsc.id != resourceId)
    resources.setAttribute("value", JSON.stringify(resourcesArr))
    resourceItems.removeChild(document.getElementById(elemId))
}

function changeQty ( e ) {
    const id = parseInt(e.dataset.id);
    resourcesArr = resourcesArr.map(src => src.id == id ? {...src, quantity: parseInt(e.value) } : src);
    resources.setAttribute("value", JSON.stringify(resourcesArr))
}




document.querySelector('.hideBtn').addEventListener('click',hideSearch);
document.querySelector('.showBtn').addEventListener('click',showSearch);

function showSearch()
{
   document.querySelector('.overlaySearch').style.display = "block";
}

function hideSearch()
{
   document.querySelector('.overlaySearch').style.display = "none";
}
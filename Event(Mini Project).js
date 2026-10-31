let attendees = [
    { id: 101, name: "Ananya Sharma", email: "ananya@example.com", event: "Tech Symposium 2026", ticket: "General" },
    { id: 102, name: "Rahul Verma", email: "rahul@example.com", event: "AI Workshop", ticket: "VIP" }
];

document.addEventListener("DOMContentLoaded", () => {
    renderTable();

    document.getElementById("regForm").addEventListener("submit", function(e) {
        e.preventDefault();
        
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const event = document.getElementById("event").value;
        const ticket = document.getElementById("ticket").value;
        const newId = attendees.length > 0 ? attendees[attendees.length - 1].id + 1 : 101;

        attendees.push({ id: newId, name, email, event, ticket });
        renderTable();
        this.reset();
    });
});

function renderTable() {
    const tbody = document.getElementById("table-body");
    tbody.innerHTML = "";

    attendees.forEach((item, index) => {
        tbody.innerHTML += `
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.email}</td>
                <td>${item.event}</td>
                <td>${item.ticket}</td>
                <td><button class="btn-del" onclick="removeRow(${index})">Delete</button></td>
            </tr>
        `;
    });
    document.getElementById("attendee-count").innerText = attendees.length;
}

function removeRow(index) {
    attendees.splice(index, 1);
    renderTable();
}

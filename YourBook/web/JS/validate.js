var borderOk = '2px solid #080';
var borderNo = '2px solid #f00';
var passwordOk = false;
var nomeOk = false;
var emailOk = false;

function validaPassword() {
    var inputpw = document.forms['registration']['pwd'];
    var inputpwconf = document.forms['registration']['pwdConf'];
    var password = inputpw.value;

    if (password.length >= 8 && password.toUpperCase() != password
        && password.toLowerCase() != password && /[0-9]/.test(password)) {
        inputpw.style.border = borderOk;

        if (password == inputpwconf.value) {
            inputpwconf.style.border = borderOk;
            passwordOk = true;
        } else {
            inputpwconf.style.border = borderNo;
            passwordOk = false;
        }
    } else {
        inputpw.style.border = borderNo;
        inputpwconf.style.border = borderNo;
        passwordOk = false;
    }

    cambiaStatoRegistrami();
}

function validaNome() {
    var inputNome = document.forms['registration']['nome'];

    if (inputNome.value.trim().length > 0
        && inputNome.value.match(/^[ a-zA-Z\u00C0-\u00ff]+$/)) {
        inputNome.style.border = borderOk;
        nomeOk = true;
    } else {
        inputNome.style.border = borderNo;
        nomeOk = false;
    }

    cambiaStatoRegistrami();
}

function validaEmail() {
    var input = document.forms['registration']['email'];
    if (input.value.match(/^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w+)+$/)) {
        input.style.border = borderOk;
        emailOk = true;
    } else {
        input.style.border = borderNo;
        emailOk = false;
    }

    cambiaStatoRegistrami();
}

function cambiaStatoRegistrami() {
    if (passwordOk && nomeOk && emailOk) {
        document.getElementById('registrami').disabled = false;
        document.getElementById('result').innerHTML = 'Registrato con successo';
    } else {
        document.getElementById('registrami').disabled = true;
        document.getElementById('result').innerHTML = 'Verifica che tutti i campi siano in verde.';
    }
}
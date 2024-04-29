exports.success = (req, res, mesnsaje = "", status = 200) => {
  res.status(status).send({
    error: false,
    status: status,
    body: mesnsaje,
  });
};

exports.error = (req, res, mesnsaje, status = 500) => {
  res.status(status).send({
    error: true,
    status: status,
    body: mesnsaje,
  });
};

exports.handleLogin = (req, res, items) => {
  if (items && items.length === 0 ) {
    res.status(401).json({
      error: true,
      status: "Login Not Success",
      message: "Invalid username or password",
    });
    return;
  } else {
    res.status(200).json({ error: false, status: "Success", message: "Login Success" });
  }
};

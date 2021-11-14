const jwt = require('jsonwebtoken')

const signIn = (req, res) => {
    // Get credentials from JSON body
    const { body } = req
    // Create a new token with the username in the payload
    // and which expires 300 seconds after issue
    const token = jwt.sign({ body }, 'Donkey@2017', {
        algorithm: 'HS256',
        expiresIn: 43200 * 1
    })
    // res.json({ status: "success", token: token })
    return { status: "success", token: token }
}

const welcome = (req, res) => {
    // We can obtain the session token from the requests cookies, which come with every request
    const token = req.token
    // if the cookie is not set, return an unauthorized error
    if (!token) {
        return res.status(401).end()
    }
    var payload
    try {      
        payload = jwt.verify(token, 'Donkey@2017')
    } catch (e) {
        if (e instanceof jwt.JsonWebTokenError) {
            // if the error thrown is because the JWT is unauthorized, return a 401 error
            return res.status(401).json(e)
        }
        // otherwise, return a bad request error
        return res.status(400).end()
    }
    // res.json({ status: "success", data: payload })
    return { status: "success", data: payload }
}

const verifyToken = (req, res, next) => {
    const header = req.headers['auth'];
    if (typeof header !== 'undefined') {
        req.token = header;
        next();
    }
    else {
        res.json({ status: 'failed', data: 'Token failed' });
    }
}

module.exports = {
    signIn,
    welcome,
    verifyToken
}
// require your Model phrase here
const User = require ('../../database-mysql/index');

let getAll = async (req, res) => {
  try{
    const users= await User.findAll();
    res.json(users)
  }
  catch(err){
    console.error(err);
  }
};
let getone=async(req,res)=>{
  try {
    const id = req.params.idu; 
    const user = await User.findOne({ where: { idu: id } });

    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    res.json(user);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

let adduser=async(req,res)=>{
  try{
    const user = await User.create(req.body);
    console.log("user adedd");
    res.json(user)
  }
  catch(e){
    console.log("error",e);
  }
}

module.exports={getAll,getone,adduser}
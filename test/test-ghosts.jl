include("common.jl")

import JetReconstruction: GhostGeneration

@testset "Ghost Creation Tests" begin
    resolution = 1000
    gen = GhostedArea(resolution)

    # Create original event with preexisting PseudoJets
    event = [
        PseudoJet(pt = 1.1, rap = 1.0, phi = 1.3),
        PseudoJet(pt = 2.4, rap = 3.2, phi = 0.8),
        PseudoJet(pt = 0.9, rap = 0.5, phi = 3.0),
        PseudoJet(pt = 0.4, rap = 6.0, phi = 5.2)
    ]
    num_original = length(event)

    # Use the function being tested
    add_ghosts!(event, gen)

    # Ensure that the correct number of ghosts were generated
    num_ghosts = resolution * resolution
    @test length(event) == num_original + num_ghosts

    # # Ensure that the original jets have not changed
    # @test event[1].pt == 1.1
    # @test event[2].rap == 3.2
    # @test event[3].phi == 3.0
    # @test event[4].pt == 0.4

    # # Check that all added ghosts have the correct pt
    # @test all(i -> i.pt == 1.0f-45, event[n_original+1:end])
end